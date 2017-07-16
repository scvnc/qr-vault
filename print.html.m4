<!doctype html>
<html>
<style>

    
  * { margin: 0 !important; padding: 0 !important; }
  html, body {
    /*changing width to 100% causes huge overflow and wrap*/
    height:100%; 
    overflow: hidden;
    background: #FFF; 
    font-size: 9.5pt;
  }
  
.container {
    width: 100%;
    height: 100%;
}

  .qrcontainer {
      width: 50%;
  }




</style>

<body>
    
    <div class="container">
        <img src="data:image/png;base64,syscmd(base64 build/1.png)" />
        <img src="data:image/png;base64,syscmd(base64 build/2.png)" />
        <img src="data:image/png;base64,syscmd(base64 build/3.png)" />
        <img src="data:image/png;base64,syscmd(base64 build/4.png)" />
    </div>

</body>
</html>
