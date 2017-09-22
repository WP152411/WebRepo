function menu_over(e) {
	e.setAttribute("class", "nav-item active"); // <li class = "nav-item"

}
function menu_out(e) {
	e.setAttribute("class", "nav-item"); // <li class = "nav-item"
}
$(document).ready(function() {
	$('#loginForm').submit(function(event) {
		// submit되는 것을 막기
		event.preventDefault();
		// id, pawd 값 가져오기
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		console.log(id, pwd);

		// 서버로 post방식 전송 (ajax)
		$.post("http://httpbin.org/post", {
			id : id,
			pwd : pwd
		}, function(data) {
			// 서버로부터 응답을 받으면
			// alert(data.form.id + '님 로그인되었습니다.');
			var myModal = $('#myModal');
			myModal.modal();
			myModal.find('.modal-body').text(data.form.id + '님 로그인되었습니다.');
		});
	});

	$('#signupForm').submit(function(event) {
		event.preventDefault();
		var name = $("#name").val();

		$.post("http://httpbin.org/post", {
			name : name
		}, function(data) {
			var signUp = $('#signUpModal');
			signUp.modal();
			signUp.find('.modal-body').text(data.form.name + '님 회원가입 되었습니다.');
		});
	});
});
