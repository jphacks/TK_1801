{include file="header.tpl" title="Log in"}
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pt100{
    padding-top: 100px;
  }
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    background-color: #FF2525 ;
    color: #ffffff
  }
  .input-group-addon{

  }
</style>
<section class="u-pd-lr30 text-center">
  <h2 class="u-pt100 u-color-gray">Sign In</h1>
  <div class="input-group u-pt30">
    <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
    <input type="text" class="form-control" placeholder="your name">
  </div>
  <div class="input-group  u-pt30">
    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
    <input type="text" class="form-control" placeholder="email address">
  </div>
  <div class="input-group u-pt30">
    <span class="input-group-addon"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></span>
    <input type="text" class="form-control" placeholder="password">
  </div>
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Sign In</button>
  </div>
  {include file="footer.tpl"}
</section>