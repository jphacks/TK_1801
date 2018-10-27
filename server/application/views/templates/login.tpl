{include file="header.tpl" title="Sign In"}
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
  .u-pb100{
    padding-bottom: 100px;
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
<section class="u-pd-lr30">
  <h2 class="caption u-color-gray text-center">Sign In</h2>
  <form action="/login" method="POST">
    {if isset($error_message)}
        <div class="alert alert-danger"><strong>Error</strong>: {$error_message}</div>
    {/if}
    <div class="form-group">
      <label for="email_address" class="control-label">Email Address</label>
      <div class="input-group">
        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
        <input name="email_address" type="text" class="form-control" placeholder="Email Address" value="{if isset($email_address)}{$email_address|escape}{/if}">
      </div>
    </div>
    <div class="form-group">
      <label for="password" class="control-label">Password</label>
      <div class="input-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
          <input name="password" type="password" class="form-control" placeholder="Password">
      </div>
    </div>
    <div class="u-pt30">
        <button class="p-button-main" type="submit" name="button">Sign In</button>
    </div>
  </form>
  <div class="u-pt30 text-center">Don't have an account? Register <a href="/register">here</a>!</div>
</section>
{include file="footer.tpl"}
