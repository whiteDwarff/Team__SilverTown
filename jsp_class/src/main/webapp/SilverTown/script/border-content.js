
 function confirmDelete() {
        if (confirm("삭제하시겠습니까?")) 
          location.href = "boardDelete.jsp?boardId=<%=boardId%>";
		}
 function confirmCommentDelete() {
		if (confirm("댓글을 삭제 하시겠습니까?")) 
		  location.href = "";
}

const uddateButton = document.getElementById('update-button'),
	  content = document.querySelector('#main-content .qna-wrap .content'),
	  updateBtn =  document.getElementById('main-update-button'),
	  mainHiddenForm = document.getElementById('main-hidden-form');


updateBtn.addEventListener('click', e => {
		
	mainHiddenForm.classList.toggle('hidden');
})
