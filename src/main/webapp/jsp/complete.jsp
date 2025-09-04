<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>お問い合わせ完了</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<h1>お問い合わせ完了</h1>
		<p class="success-message">
			お問い合わせいただき、誠にありがとうございます。<br>
			内容を確認後、改めてご連絡させていただきます。
		</p>
		<div class="button-group">
			<!-- トップに戻る -->
			<a href="${pageContext.request.contextPath}/inquiry" class="button">トップに戻る</a>
			
			<!-- お問い合わせ履歴を見る -->
			<a href="${pageContext.request.contextPath}/inquiry?action=history" class="button secondary">
				お問い合わせ履歴を見る
			</a>
		</div>
	</div>
</body>
</html>
