<?php
include_once 'dbconfig.php';

if(!$user->is_loggedin())
{
 $user->redirect('index.php');
}

$user_id = $_SESSION['user_session'];
$stmt = $conn->prepare("SELECT * FROM logins WHERE id=:id");
$stmt->execute(array(":id"=>$user_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);

?>

<script>
    function openNav()
    {
        document.getElementById("sideBar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }
    function closeNav()
    {
        document.getElementById("sideBar").style.width = "0px";
        document.getElementById("main").style.marginLeft = "0";
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>User Stats - A3Contractors</title>
</head>
    
<body>

<div class="header">
 <div class="left">
     <label><i class="glyphicon glyphicon glyphicon-align-justify" onclick="openNav()"></i></label>
     <label><a href="http://a3contractors.com/">a3Contractors - Admin Panel</a></label>
    </div>
    <div class="right">
     <label><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i> Logout</a></label>
    </div>
</div>
<div id="sideBar" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" >&times;</a>
    <a href="home.php"> Home</a>
    <a href="userdb.php"> User Stats</a>
    <a href="sales.php"> Sales</a>
    <a href="purchases.php"> Purchases</a>
</div>
    
<div id="main">
    <div class="content">
       <table style = "width:100%";>
            <tr>
                <th>Date</th>
                <th>UID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Classname</th>
            </tr>
           <?php
                $stmt = $conn->prepare("SELECT * FROM sales");
                $stmt->execute();
                $userData=$stmt->fetchAll(PDO::FETCH_ASSOC);
           
                foreach ($userData as $userIndex)
                {
                    echo "<tr>";
                        echo "<td>";
                        print_r ($userIndex['date']); 
                        echo "</td>";

                        echo "<td>";
                        print_r ($userIndex['uid']); 
                        echo "</td>";
                    
                        echo "<td>";
                        print_r ($userIndex['name']); 
                        echo "</td>";
                    
                        echo "<td>";
                        print_r ($userIndex['price']); 
                        echo "</td>";                    
                        
                        echo "<td>";
                        print_r ($userIndex['class']); 
                        echo "</td>";
                    echo "</tr>";
                }
            ?>
        </table>
        </div>
</div>
    
</body>
</html>