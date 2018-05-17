package com.coffee.util;

public class StringUtil {
	
	/**
     * @Description: 将数组转换为字符串
     * @param @param arr
     * @return String    返回类型
	*/
	public static String fromStrArry(String[] arr) {
		if (arr == null || arr.length == 0) {
			return null;
		}
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
			if (i < arr.length - 1) {
				sb.append(",");
			}
		}
		return sb.toString();
	}
}
