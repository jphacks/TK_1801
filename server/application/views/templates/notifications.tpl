{include file="header.tpl" title="Notifications" user=$user}

<!--add the special style sheet of this page here!-->
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt10{
    padding-top: 10px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pl30{
    padding-left: 30px;
  }
  .u-pt100{
    padding-top: 100px;
  }
  .u-pt50{
    padding-top: 50px;
  }
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    background-color: #FF2525;
    color: #ffffff
  }
  .input-group-addon{

  }
  p,h1,h2,h3,h4{
    color: gray;
  }

  div.circle button.rateit-reset {
    display: none;
    width:50px;
    height:50px;
}
.p-user_icon{
  width: 125px;
  height: 125px;
  border-radius: 250px;
  border: solid 1px #FD5637;
}
.u-t12{
  font-size: 12px;
}
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="u-pt50 text-center">Notifications</h1>

  <!--Button to change own information-->
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Settings</button>
  </div>
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Your Reviews</button>
  </div>
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Edit Profile</button>

  </div>
</section>

{include file="footer.tpl"}
