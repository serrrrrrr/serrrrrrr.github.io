<?php
	$tmp=file_get_contents("index.tpl");
	$content="";
	$objects="";
	function load_content($s)
	{
		$GLOBALS['content'].=$s;
	}
	
	$D=$_GET["D"];
	switch ($D) {
		case "1": $content=file_get_contents("object1.1.html"); break;
		case "2": $content=file_get_contents("object1.2.html"); break;
		case "3": $content=file_get_contents("object1.3.html"); break;
		case "4": $content=file_get_contents("object2.1.html"); break;
		case "5": $content=file_get_contents("object2.2.html"); break;
		case "6": $content=file_get_contents("object2.3.html"); break;
		case "7": $content=file_get_contents("object3.1.html"); break;
		case "8": $content=file_get_contents("object3.2.html"); break;
		case "9": $content=file_get_contents("object3.3.html"); break;
		default:  {
			$C = $_GET["C"];
			switch ($C) {
				case "1": $content=file_get_contents("object1DES.html"); break;
				case "2": $content=file_get_contents("object2DES.html"); break;
				case "3": {
					ob_start('load_content');
					include("object3DES.php");
					ob_end_flush();
				}
				break;
				default:  $content=file_get_contents("description.html");
			}
		}
	}
	
				$D=$_GET["D"];
				switch ($D) {
					case "1":
					case "2":
					case "3": $objects=file_get_contents("object1.html"); break;
					case "4":
					case "5": 
					case "6": $objects=file_get_contents("object2.html"); break;
					case "7":
					case "8":
					case "9": $objects=file_get_contents("object3.html"); break;
					default:  {
						$C = $_GET["C"];
						switch ($C) {
							case "1": $objects=file_get_contents("object1.html"); break;
							case "2": $objects=file_get_contents("object2.html"); break;
							case "3": $objects=file_get_contents("object3.html"); break;
							default:  $objects=file_get_contents("object.html");
						}
					}
				}
				$tmp=str_replace("{content}", $content, $tmp);
				$tmp=str_replace("{objects}", $objects, $tmp);
				echo $tmp;
				?>