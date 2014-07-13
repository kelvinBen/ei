/*    */package net.mast.demo;

/*    */
/*    */import java.util.ResourceBundle;

/*    */
/*    */public class DP
/*    */{
	/*  6 */private static String Bundle = "net.mast.demo.loushang_demo";
	/*    */
	/*  8 */private static ResourceBundle rb = ResourceBundle.getBundle(Bundle);

	/*    */
	/*    */public static String getString(String resource) {
		/* 11 */return rb.getString(resource);
		/*    */}
	/*    */
}

/* Location:           E:\temp\mast_demo.jar
 * Qualified Name:     net.mast.demo.DP
 * JD-Core Version:    0.5.3
 */