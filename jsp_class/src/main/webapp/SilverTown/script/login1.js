    const joinBtn = document.getElementById('join-btn'),
              loginBtn = document.getElementById('login-btn'),
              join = document.getElementById('join'),
              login = document.getElementById('login'),
              loginForm = document.getElementById('login-form'),
              loginInput = document.querySelectorAll('#login-form input')
              joinForm = document.getElementById('join-form'),
              joinInput = document.querySelectorAll('#join-form input');

        // 로그인 / 회원가입 화면전환
        joinBtn.addEventListener('click', () => {
            for(let i=0; i<loginInput.length-1; i++) loginInput[i].value = '';
            join.style.display = 'block'
            login.style.display = 'none'
        });
        loginBtn.addEventListener('click', () => {
            for(let i=0; i<joinInput.length-1; i++) joinInput[i].value = '';
            login.style.display = 'block'
            join.style.display = 'none'
        });
        // 로그인 유효성 검사
        loginForm.addEventListener('submit', e => {
            if(submitTest(loginInput[0])){
				changeStyle(loginInput[0], '#73d09a', '아이디를 입력하세요.');
				e.preventDefault();
			} else if(submitTest(loginInput[1])) {
				changeStyle(loginInput[1], '#73d09a', '비밀번호를 입력하세요.');
				e.preventDefault();
            }
        })
        for(let item of loginInput) {
            item.addEventListener('keydown', e => {
                if(e.target.value.length > 0) changeStyle(e.target, '#ccc');
            })
        };
        // 회원가입 유효성 검사
        joinForm.addEventListener('submit', e => {
            if(submitTest(joinInput[0])){
							changeStyle(joinInput[0], '#73d09a', '이메일을 입력하세요.');
							e.preventDefault();
						} else if(submitTest(joinInput[1])) {
							changeStyle(joinInput[1], '#73d09a', '이름을 입력하세요.');
							e.preventDefault();
						} else if(submitTest(joinInput[2])) {
							changeStyle(joinInput[2], '#73d09a', '휴대폰 번호를 입력하세요.');
								e.preventDefault();
						} else if(submitTest(joinInput[3])) {
							changeStyle(joinInput[3], '#73d09a', '비밀번호를 입력하세요.');
								e.preventDefault();
						} 
        });
        for(let item of joinInput) {
            item.addEventListener('keydown', e => {
                if(e.target.value.length > 0) changeStyle(e.target, '#ccc');
            })
        }

        const submitTest = (selector) => selector.value.length < 1;
        const changeStyle = (selector, textColor, message='') => {
            selector.style.border = `1px solid ${textColor}`;
            if(message != '') alert(message);
        }
        
        
