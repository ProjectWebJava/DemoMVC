/**Read and Write Cookie*/

//Đọc và trả về giá trị của cookie
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//Trả về tên của cookie
function getNameCookie(cookie){
	return cookie.split("=")[0];
}

//Lưu một cookie mới
function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";" + ";path=/";
}

//Trả về danh sách cookie có trong page hiện tại
function getListCookie(){
	var cookies = document.cookie.split(';');
    var result = [];
    for (var i = 0 ; i < cookies.length; i++) {
    	result[i] = cookies[i];
    }
    return result;
}

//Lấy cookie tại vị trí index trong danh sách cookie
function getCookieAt(arr, index){
	if (arr.length <= index) return null;
	return arr[index];
}

//Xóa cookie
function deleteCookie(cname) {
	if(getCookie(cname) != "") {
		document.cookie = cname + "=;;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT";
	}
}