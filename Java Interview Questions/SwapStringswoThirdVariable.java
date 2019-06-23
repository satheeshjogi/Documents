package com.Practice;

public class SwapStringswoThirdVariable {

	public static void main(String[] args) {
		String a="satheesh";
		String b="kumar";
		
		a=a+b;
		System.out.println("Combined String :"+a);
		b=a.substring(0,a.length()-b.length());
		System.out.println("b value after swap:"+b);
		a=a.substring(b.length(),a.length());
		System.out.println("a value after swap:"+a);

	}

}
