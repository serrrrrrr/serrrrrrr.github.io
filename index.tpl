<html>
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="mystyle.css">
		<title>Elon Musk</title>
		<script language="JavaScript">
			function check(form) {
			
				var re = /^[7-8]{1}[0-9]{10}$/;
				var text = form.login.value;
				var validPhone = re.test(text);
				
				re= /^[a-zA-Zа-яА-Я]{4,30}$/;
				text = form.username.value;
				var validName = re.test(text);
				
				if (!validPhone) 
					document.getElementById("login").innerHTML="<div class=\"reg\" id=\"login\">Обязательное поле<br></div>"; 
				else 
					document.getElementById("login").innerHTML="<div class=\"reg\" id=\"login\"><br></div>"; 

				if (!validName) 
					document.getElementById("username").innerHTML="<div class=\"reg\" id=\"username\">Обязательное поле<br></div>"; 
				else 
					document.getElementById("username").innerHTML="<div class=\"reg\" id=\"username\"><br></div>"; 
	
				if (!form.pass.value) 
					document.getElementById("password").innerHTML="<div class=\"reg\" id=\"password\">Обязательное поле<br></div>"; 
				else 
					document.getElementById("password").innerHTML="<div class=\"reg\" id=\"password\"><br></div>"; 

				if (!form.confirm.checked) 
					document.getElementById("confirm").innerHTML="<div class=\"reg\" id=\"confirm\">Необходимо соглашение<br></div>"; 
				else 
					document.getElementById("confirm").innerHTML="<div class=\"reg\" id=\"confirm\"><br></div>"; 
				
				if (validPhone && validName && form.pass.value && form.confirm.checked)
					form.submit();

				}
			function add (form) {
				var newDiv = document.createElement("div");
				newDiv.innerHTML = "<a href=\""+form.link.value+"\" target=\"Object\" onclick=\"window.open('"+form.description.value+"','Description');\">"+form.name.value+"</a> | <a class=\"del\" onclick=\"del(this)\">Удалить</a>";
				var cat = document.getElementById("categories");
				cat.appendChild(newDiv)
			}
			
			function del (toDel) {
			var toDel_parent=toDel.parentNode;
			toDel_parent.parentNode.removeChild(toDel_parent);
			}
			
			function setStyle(form) {
				switch (form.style.value) {
					case "0": {
						var css_file = "mystyle.css"
					}; break;
					case "1": {
						var css_file = "mystyle2.css"
					}; break;
					case "2": {
						var css_file = "mystyle3.css"
					}; break;
				}
				var link=document.getElementsByTagName("link")[0];
				
				document.getElementsByTagName("head")[0].removeChild(link);
	
				var link = document.createElement("link");
				
				link.setAttribute("rel","stylesheet");
				link.setAttribute("type","text/css");
				link.setAttribute("href",css_file);
				
				document.getElementsByTagName("head")[0].appendChild(link);
			}
		</script>
	</head>
	<body>
		<div id="index1">
			<div id="categories">
				<div><a href="index.php">Home</a></div>
				<div><a href="index.php?C=1">Tesla</a> | <a class="del" onclick="del(this)">Удалить</a></div>
				<div><a href="index.php?C=2">SpaceX</a> | <a class="del" onclick="del(this)">Удалить</a></div>
				<div><a href="index.php?C=3">Other</a> | <a class="del" onclick="del(this)">Удалить</a></div>
			</div>
			<div class="formcat">
				<form><br>
					<input name="name" placeholder="Введите категорию" type="text" size="20" maxlength="30">
					<input name="link" placeholder="Введите ссылку" type="text" size="20" maxlength="30">
					<input name="description" placeholder="Введите ссылку описания" type="text" size="25" maxlength="30">
					<input type="button" value="Добавить" onclick="add(this.form)">
				</form>
			</div>
		</div>
		<div id="index2">
			{content}
		</div>
		<div id="index3">
			{objects}
		</div>
	</body>
</html>	