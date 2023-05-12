const mainUrl = document.getElementsByClassName('url-title')[0],
		  subUrls = document.getElementsByClassName('sub-url-title'),
		  li = document.querySelectorAll('.list li');
		  
		  
for(let i=0; i<subUrls.length; i++) {
	if(mainUrl.innerText == subUrls[i].innerText) {
		li[i].style.background = 'rgb(244, 244, 244)';
		// li[i].style.border = '1px solid #f00';
	} else {
		li[i].style.backgroundColor = '#fff';
	}
} 
