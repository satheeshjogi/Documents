package com.Practice;

public class ReverseArray {

	public static void main(String ar[]) {
		String[] a = { "abc", "xyz", "123", "894", "hello", "Hi", "who" };
		// My approach
		String[] rev = new String[a.length];
		for (int i = a.length-1,j=0; i >= 0; i--,j++) {
			rev[i] = a[j];
		}
		for (int i =0;i< rev.length; i++) {
			System.out.println(rev[i]);
		}
		
		
		// Correct or efficient Approach
		int len=a.length;
		for(int i=0;i<len/2;i++){
			String temp=a[i];
			a[i]=a[len-i-1];
			a[len-i-1]=temp;
		}
		for (int i =0;i< a.length; i++) {
			System.out.println(a[i]);
		}
	}
}
