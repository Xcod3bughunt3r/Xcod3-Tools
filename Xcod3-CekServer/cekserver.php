<center>
Cek Kernel <br>
<?php
echo php_uname();
?>
<br>
<br>
Cek Sistem Operasi<br>
<?php
echo PHP_OS;
?>
<br>
<br>

Cek User Linux Di Server/Hosting<br>
<?php
for ($uid = 0; $uid < 5000; $uid++) { 
  $x = posix_getpwuid($uid); 
  if (!empty($x)) { 
    while (list($kunci, $cek) = each($x)) { print "{$cek}:"; } print "<br />"; 
  }
}
?>
</center>
