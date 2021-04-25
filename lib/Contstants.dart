class Constants
{
   static String loginUrl='http://itprojects.co.in/app/veginravet/ws/login.php';
   static String cityUrl='http://itprojects.co.in/app/veginravet/ws/allsociety.php';

   static String categaryUrl='http://itprojects.co.in/app/veginravet/ws/category.php';

   static String sliderUrl='http://itprojects.co.in/app/veginravet/ws/slider.php';


}

/*

interface ApiService {
    @FormUrlEncoded
    @POST("login.php")
        fun userLogin(@Field("contactno") mobile: String,@Field("password") password: String,@Field("regId") regId: String): Call<ResponseBody>


    @FormUrlEncoded
    @POST("notifectationcount.php")
    fun notificationCount(@Field("id") id: String): Call<ResponseBody>


    @FormUrlEncoded
    @POST("updatenotifecation.php")
    fun updateNotification(@Field("id") id: String): Call<ResponseBody>

    @FormUrlEncoded
    @POST("forgetotp.php")
    fun forgetOtp(@Field("contactno") mobile: String): Call<ResponseBody>

    @FormUrlEncoded
    @POST("updatepassword.php")
    fun updatePassword(@Field("contactno") mobile: String,@Field("pass") pass: String): Call<ResponseBody>


    @FormUrlEncoded
    @POST("register.php")
    fun register(@Field("name") userid: String,@Field("contactno") contactno: String,@Field("password") password: String,@Field("fno") fno: String,@Field("sid") sid: String,@Field("regId") regId: String): Call<ResponseBody>

    @FormUrlEncoded
    @POST("otp.php")
    fun getOtp(@Field("contactno") contactno: String): Call<ResponseBody>

    @POST("allsociety.php")
    fun getAllCociety(): Call<List<SocietyModel>>
    @POST("category.php")
    fun getAllCategory(): Call<List<CategoryModel>>


    @POST("product.php")
    fun getProductAll(): Call<List<ProductModel>>

    @FormUrlEncoded
    @POST("catproduct.php")
    fun getProduct(@Field("id") id: String): Call<List<ProductModel>>


    @FormUrlEncoded
    @POST("saveorder.php")
    fun placeOrder(@Field("userId") userId: String,@Field("productId") productid: String,@Field("quantity") quantity: String,@Field("amount") amount: String,@Field("total") total: String,@Field("notes") notes: String): Call<ResponseBody>

    @FormUrlEncoded
    @POST("myorder.php")
    fun getMyOrder(@Field("userId") id: String): Call<List<MyOrderModel>>


    @FormUrlEncoded
    @POST("notification.php")
    fun getNotification(@Field("userid") id: String): Call<List<NotificationModel>>



}

 */