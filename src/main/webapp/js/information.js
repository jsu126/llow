/**
 * @author Stodger
 */

$(function() {
	$("#pic").click(function() {
		$("#upload").click();
		$("#upload").on("change", function() {
			var objUrl = getObjectURL(this.files[0]);
			if(objUrl){
				$("#pic").attr("src",objUrl);
				uploadImage();
			}
		})
	})
})

//
function getObjectURL(file) {
	var url = null;
	if (window.createObjectURL != undefined) { // basic
		url = window.createObjectURL(file);
	} else if (window.URL != undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if (window.webkitURL != undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}