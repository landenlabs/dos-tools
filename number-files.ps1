 $i=1
  Get-ChildItem *.jpg | %{Rename-Item $_ -NewName ('img{0:D4}.jpg' -f $i++)}
