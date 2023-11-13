const advisorRegister = {
    vesion : 1,
    init : function(){
        const nickname = document.getElementById('advisorNickname');
        nickname.addEventListener('keyup', this.duplicateNickname.bind(this));
        const advisorRegisterForm = document.getElementById('advisorRegisterForm');
        advisorRegisterForm.addEventListener('submit', function(){});
    },

    duplicateNickname: function(event){
        let nicknameValue = event.target.value;
        
        if(nicknameValue.length > 4){
            fetch('/advisor/register/duplicate?advisorNickname=' + nicknameValue)
                .then(response => response.json())
                .then(data => {
                    if(data.result > 0){
                        alert('이미 사용중인 닉네임입니다.')
                        event.target.focus();
                    }
                })
                .catch(error => console.log(error));
        }

    },
};
advisorRegister.init();