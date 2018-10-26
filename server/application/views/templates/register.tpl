{include file="header.tpl" title="アカウント新規登録"}
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pt50{
    padding-top: 50px;
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
  <form action="/register/submit" method="POST">
    {if isset($error_message)}
        <div class="alert alert-danger"><strong>エラー</strong>: {$error_message}</div>
    {/if}
    <h2 class="u-pt50 u-color-gray">Sign Up</h1>
    <div class="input-group u-pt30">
        <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
        <input name="name" type="text" class="form-control" placeholder="Your name">
    </div>
    <div class="input-group  u-pt30">
        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
        <input name="email_address" type="text" class="form-control" placeholder="Email address">
    </div>
    <div class="input-group u-pt30">
        <span class="input-group-addon"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></span>
        <input name="password" type="text" class="form-control" placeholder="Password">
    </div>
    <div class="u-pt30">
        <button class="p-button-main" type="submit" name="button">登録する</button>
    </div>
    {include file="footer.tpl"}
  </form>
</section>
