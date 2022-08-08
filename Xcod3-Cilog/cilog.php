<?php
// ALIF FUSOBAR - @Xcod3bughunt3r
// aku.aliffusobar@gmail.com
// master@itsecurity.id
// www.itsecurity.id
$dbhost = '192.168.8.200'; 
$dbuser = 'rootyou'; 
$dbpass = 'killyousite'; 
$dbname = 'Syslog'; 

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (!$conn) {
   die ('Tidak bisa terkoneksi ke MySQL: ' . mysqli_connect_error()); 
   }
   $sql = 'SELECT DeviceReportedTime, Message, SysLogTag FROM  SystemEvents ORDER BY DeviceReportedTime DESC';
   $query = mysqli_query($conn, $sql);
   if (!$query) {
      die ('SQL Error: ' . mysqli_error($conn));
      }
     echo '<table border="1">
       	  <thead>
	  <tr>
		<th>Tanggal & jam</th>
		<th>SysLogTag</th>
		<th align="left" width="100px">Log dari mikrotik</th>
	 </tr>
         </thead>
         <tbody>';
		
         while ($row = mysqli_fetch_array($query))
         {
	 echo '<tr>
	        <td>'.$row['DeviceReportedTime'].'</td>
		<td>'.$row['SysLogTag'].'</td>
		<td class="right">'.$row['Message'].'</td>
		</tr>';
        }
        echo '
	</tbody>
    </table>';

mysqli_free_result($query);
mysqli_close($conn);
?>
