<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>お問い合わせフォーム</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
    	<h1>お問い合わせフォーム</h1>
    	<p class="subtitle">
    	    お気軽にお問い合わせください。<br>
    	    以下のをご入力お願いいたします。
    	</p>
		<form action="inquiry" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
			<p>
    			<label for="name">名前<span class="required">必須</span></label>
    			<input type="text" id="name" name="name" placeholder="例: 山田 太郎">
    			<span class="error-message"><c:out value='${errors.name}'/></span>
			</p>

			<p>
				<label for="email">メールアドレス<span class="required">必須</span></label>
				<input type="email" id="email" name="email" placeholder="例: taro@example.com">
				<span class="error-message"><c:out value='${errors.email}'/></span>
			</p>
			<p>
				<label for="content">内容<span class="required">必須</span></label>
				<textarea id="content" name="content" rows="5" cols="40" maxlength="200"oninput="updateCount()"></textarea>
				<span class="error-message"><c:out value='${errors.content}'/></span>
				<br>
				<span id="content-count">0 / 200文字</span>
			</p>
			<p>
				<label>カテゴリ(複数選択可)<span class="required">必須</span></label><br>
				<label><input type="checkbox" name="category" value="product">製品について</label><br>
				<label><input type="checkbox" name="category" value="bug">不具合報告</label><br>
				<label><input type="checkbox" name="category" value="request">リクエスト</label><br>
				<label><input type="checkbox" name="category" value="other">その他</label>
				<span class="error-message"><c:out value='${errors.category}'/></span>
			</p>
			<p>
				<label for="attachment">添付ファイル(任意)</label>
				<input type="file" id="attachment" name="attachment">
				<span class="error-message"><c:out value='${error-message}'/></span>
			</p>
			<p>
				<label for="captcha">スパム対策 : ${captchaQuestion}<span class="required">必須</span></label>
				<input type="text" id="captcha" name="captcha" required>
				<span class="error-message"><c:out value='${errors.captcha}'/></span>
			</p>
			<div class="button-group">
				<input type="submit" value="確認">
			</div>
		</form>
		<div class="button-group">
			<a href="inquiry?action=history" class="button secondary">お問い合わせ履歴を見る</a>
		</div>
	</div>
<script>
	function validateForm() {
		let isValid = true;
		const name = document.getElementById('name');
		const email = document.getElementById('email');
		const content = document.getElementById('content');
		const captcha = document.getElementById('captcha');
		document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
		if (name.value.trim() === '') {
			document.querySelector('#name + .error-message').textContent = '名前は必須です。';
			isValid = false;
		}
		if (email.value.trim() === '') {
			document.querySelector('#email + .error-message').textContent = 'メールアドレスは必須です。';
			isValid = false;
		} else if (!/^[\w.-]+@[\w.-]+\.\w+$/.test(email.value)) {
			document.querySelector('#email + .error-message').textContent = '有効なメールアドレスを入力してください。';
			isValid = false;
		}
		if (content.value.trim() === '') {
			document.querySelector('#content + .error-message').textContent = '内容は必須です。';
			isValid = false;
		}
		if (captcha.value.trim() === '') {
			document.querySelector('#captcha + .error-message').textContent = 'スパム対策の質問に答えてください。';
			isValid = false;
		}
		return isValid;
	}

	function updateCount() {
		const textarea = document.getElementById('content');
		const counter = document.getElementById('content-count');
		counter.textContent = textarea.value.length + " / " + textarea.maxLength + "文字";
	}
	window.onload = updateCount;

	function toHalfWidth(str) {
		return str.replace(/[\uFF01-\uFF5E]/g, function(ch) {
			return String.fromCharCode(ch.charCodeAt(0) - 0xFEE0);
			}).replace(/\u3000/g, " "); // 全角スペースを半角スペースにする
			}

	window.onload = function() {
		const email = document.getElementById("email");
		const captcha = document.getElementById("captcha");

		function bindHalfWidth(input) {
			if (!input) return;
			input.addEventListener("input", function() {
				this.value = toHalfWidth(this.value);
				});
			}

	    bindHalfWidth(email);
	    bindHalfWidth(captcha);
	    };
</script>
</body>
</html>