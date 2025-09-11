<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>お問い合わせ内容確認</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<h1>お問い合わせ内容確認</h1>
		<p>以下の内容でよろしいですか？</p>
		
		<div class="display-info">
			<p><strong>名前:</strong> <%= request.getAttribute("name") %></p>
			<p><strong>メールアドレス:</strong> <%= request.getAttribute("email") %></p>
			<p><strong>内容:</strong></p>
			<pre><%= request.getAttribute("content") %></pre>
			<p><strong>カテゴリ:</strong>
				<c:choose>
					<c:when test="${inquiry.category == 'product'}">製品について</c:when>
					<c:when test="${inquiry.category == 'bug'}">不具合報告</c:when>
					<c:when test="${inquiry.category == 'request'}">機能リクエスト</c:when>
					<c:when test="${inquiry.category == 'sales'}">営業目的(営業権の購入に同意する)</c:when>
					<c:when test="${inquiry.category == 'other'}">その他
						<c:if test="${not empty inquiry.otherCategory}">
							<c:out value="${inquiry.otherCategory}"/>
						</c:if>
					</c:when>
				</c:choose>
			</p>
			<p><strong>添付ファイル:</strong>
				<% String attachmentFileName = (String) request.getAttribute("attachmentFileName"); %>
				<% if (attachmentFileName != null && !attachmentFileName.isEmpty()) { %>
					<%= attachmentFileName %>
				<% } else { %>
					なし
				<% } %>
			</p>
		</div>
		
		<form action="inquiry" method="post">
			<input type="hidden" name="action" value="complete">
			<div class="button-group">
				<input type="submit" value="送信">
				<a href="inquiry" class="button secondary">戻る</a>
			</div>
		</form>
	</div>
</body>
</html>