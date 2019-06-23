package com.Practice;

public class PrintValuebwLasthashes {

	public static void main(String[] args) {
		String s = "123#abc#abcde#ddd#";
		/*Method 1: In this method, if value b/w last two strings is empty then it will give last but one. 
		But method two will give correct string*/ 
		String ar[] = s.split("#");
		System.out.println("value bw last two #'s is : " + ar[ar.length - 1]);
		
		//Method 2: 
		int last=s.lastIndexOf('#');
		int lastbut=s.lastIndexOf('#', last-1);
		System.out.println("value bw last two #'s is : " + s.substring(lastbut+1, last));
	}

}
