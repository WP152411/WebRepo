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

		
		$.post({
			url: '/WebClass/bloglogin',
			dataType: 'json',
			data: {
				'id' : id,
				'pwd' : pwd
			},
			success: function(data) {
				var myModal = $('#myModal');	
				if (data.msg == "success") {
					// 서버로부터 응답을 받으면
					// alert(data.form.id + '님 로그인되었습니다.');
					myModal.find('.modal-title').text('Result');
					myModal.find('.modal-body').text(data.name + '님 로그인되었습니다.');
					$('#loginForm').html("");
					$('#signUpForm').html("");
					$('#loginResult').html('<li class="nav-item"><a class="nav-link" href="/WebClass/bloglogout">'+data.name+'님</a></li>');
				} else {
					myModal.find('.modal-title').text('Sign Up Error');
					myModal.find('.modal-body').text('로그인 시 오류가 발생하였습니다.');
					$('#pwd').val("");
				}
				myModal.modal();
			}
		})
		
		// 서버로 post방식 전송 (ajax)
//		$.post("/WebClass/bloglogin", {
//			id : id,
//			pwd : pwd
//		}, function(data) {
//			var myModal = $('#myModal');
//			alert(data.name);
//			if (data.msg == "success") {
//				// 서버로부터 응답을 받으면
//				// alert(data.form.id + '님 로그인되었습니다.');
//				myModal.find('.modal-title').text('Result');
//				myModal.find('.modal-body').text(data.name + '님 로그인되었습니다.');
//			} else {
//				myModal.find('.modal-title').text('Sign Up Error');
//				myModal.find('.modal-body').text('로그인 시 오류가 발생하였습니다.');
//			}
//			myModal.modal();
//		});
	});

	$('#signupForm').submit(function(event) {
		event.preventDefault();
		var name = $("#name").val();

		$.post("http://localhost:8080/", {
			name : name
		}, function(data) {
			var signUp = $('#signUpModal');
			signUp.modal();
			signUp.find('.modal-body').text(data.form.name + '님 회원가입 되었습니다.');
		});
	});
});
