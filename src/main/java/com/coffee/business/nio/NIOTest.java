package com.coffee.business.nio;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;

public class NIOTest {

	public static void main(String[] args) throws IOException {		
		Pipe pipe = Pipe.open();
		Pipe.SinkChannel sinkChanel = pipe.sink();		
		
		String data = "new String to write to file..." + System.currentTimeMillis();
		ByteBuffer buf = ByteBuffer.allocate(48);
		buf.clear();
		buf.put(data.getBytes());
		
		buf.flip();
		
		while(buf.hasRemaining()) {
			sinkChanel.write(buf);
		}
		
		Pipe.SourceChannel sourceChanel = pipe.source();
		ByteBuffer buff = ByteBuffer.allocate(48);
		int byteRead = sourceChanel.read(buff);
		
		while(byteRead != -1) {
			buff.flip();
			while(buff.hasRemaining())
				System.out.print((char)buff.get());
			
			buff.clear();
			
			byteRead = sourceChanel.read(buff);
			System.out.println(byteRead);
		}
	}
}
