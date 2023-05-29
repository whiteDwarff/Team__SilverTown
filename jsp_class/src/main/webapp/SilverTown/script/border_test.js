

 function confirmCommentDelete() {
		if (confirm("댓글을 삭제 하시겠습니까?")) 
		  location.href = "";
}

const uddateButton = document.getElementById('update-button'),
	  content = document.querySelector('#main-content .qna-wrap .content'),
	  updateBtn =  document.getElementById('main-update-button'),
	  mainHiddenForm = document.getElementById('main-hidden-form'),
	  mainFormInput = document.querySelector('#main-hidden-form input:first-child');
let isUpdateState = true;

updateBtn.addEventListener('click', e => {
		
	mainHiddenForm.classList.toggle('hidden');
	if(isUpdateState) {
		e.target.innerText = '닫기';
		isUpdateState = false;
	} else {
		e.target.innerText = '수정';
		isUpdateState = true;
	}
})
mainHiddenForm.addEventListener('submit', e => {
	if(mainFormInput.value == '') {
		alert('수정사항을 입력해주세요.')
		e.preventDefault();
	} else if(mainFormInput.value.length < 5) {
		alert('최소 다섯글자 이상 입력해주세요.')
		e.preventDefault();
	} 
	setTimeout( () => {
		mainFormInput.value = '';
	}, 50)
	
})