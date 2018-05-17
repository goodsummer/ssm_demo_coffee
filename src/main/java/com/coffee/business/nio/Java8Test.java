package com.coffee.business.nio;

import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

public class Java8Test {

	public static void main(String[] args) {
		//List<String> list = Arrays.asList("34", "45", "56", "67");
//		List<Integer> list = Arrays.asList(34, 2, 3, 4);
//
//		System.out.println("n - > System.out.println(n) ------------------------");
//		list.forEach(n -> System.out.println(n));		
//		
//		System.out.println("System.out::println  -------------------------------");		
//		list.forEach(System.out::println);
//		
//		System.out.println("(n) -> true  ------------------------------");		
//		evaluate(list, (n) -> true);
//		
//		System.out.println("(n) -> false  -------------------------------");		
//		evaluate(list, (n) -> false);
//		
//		System.out.println("(n) -> n.length() > 0  ------------------------------");		
//		evaluate(list, (n) -> n%2 == 0);
//		
//		System.out.println("(n) -> n.length() == 0  -----------------------------");		
//		evaluate(list, (n) -> n%2 == 1);
//		
//		System.out.println("(n) -> (Integer.valueOf(n) == 2)  -------------------------------");		
//		evaluate(list, (n) -> (Integer.valueOf(n) == 34));
//		
//		System.out.println("-----------------------------------------");		
//		int sum = list.stream().map(x -> x*x).reduce((x,y) -> x + y).get();
//		System.out.println(sum);		
		
		
		//Converter<String, Integer> converter = Integer::valueOf;
//		Consumer<Person> greeter = (p) -> System.out.println("Hello, " + p.firstName);
//		greeter.accept(new Person("Luke", "Skywalker"));
		
		Optional<String> optional = Optional.of("hehe");

		//optional.isPresent();           // true
		//optional.get();                 // "bam"
		String sss = optional.orElse("fallback");    // "bam"
		System.out.println(sss);

		optional.ifPresent((s) -> System.out.println(s.charAt(0)));     // "b"
		
	}
	
	public static void evaluate(List<Integer> list, Predicate<Integer> predicate) {
		for(Integer l: list)  {
		    if(predicate.test(l)) {
		      System.out.println(l + " ");
		    }
		}
	}
	

}
class Person {
	
	  String firstName;
	  String lastName;
	
	Person(String firstName, String lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	Person(){}
}