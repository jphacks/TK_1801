{include file="header.tpl" title="Register" user=$user}
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .caption{
    margin-top: 50px;
    margin-bottom: 20px;
  }
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    border: none;
    background-color: #FD5637;
    color: #ffffff
  }
  .btn-primary{
    background-color: #d8c0ab;
    border: none;
  }
  .btn-primary:hover, .btn-primary:focus,
  .btn-primary:active, .btn-primary:active:focus, .btn-primary:active:hover, .btn-primary:active.focus,
  .btn-primary.active, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary.active.focus,
  .open > .dropdown-toggle.btn-primary,
  .open > .dropdown-toggle.btn-primary:hover,
  .open > .dropdown-toggle.btn-primary:focus,
  .open > .dropdown-toggle.btn-primary.focus,
  .btn-primary.disabled:hover, .btn-primary[disabled]:hover, fieldset[disabled] .btn-primary:hover,
  .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus,
  .btn-primary.disabled.focus, .btn-primary[disabled].focus, fieldset[disabled] .btn-primary.focus {
    background:rgb(255, 132, 54); //ボタンの上にポインタを持ってきたり、クリックしたりした時の背景色
    color: white; //ボタンの上にポインタを持ってきたり、クリックしたりした時のテキストの色
<<<<<<< HEAD
    box-shadow: none;
  }
  btn.active {
=======
    border: 2px solid #ffbd00;
    box-shadow: none;
  }
  .btn.active {
>>>>>>> a3158f724753f2f16655e9cc860e96ff887f95ac
    border: 2px solid #ffbd00;
  }

  .btn-primary.outline {
      border: 3px solid rgb(255, 132, 54); //アウトラインのみのボタンの線の色
      color: white ; //アウトラインのみのボタンのテキストの色
  }

</style>
<section class="u-pd-lr30">
  <h2 class="caption u-color-gray text-center u-pb100">Sign Up</h2>
  <form action="/register/submit" method="POST">
    {if isset($error_message)}
        <div class="alert alert-danger"><strong>Error</strong>: {$error_message}</div>
    {/if}
    <div class="form-group">
      <label class="control-label">Account Type</label>
      <input type="hidden" id="type" name="type" value="{if isset($type) && $type === 'guide'}guide{else}tourist{/if}">
      <div id="type-btns" class="btn-group btn-group-justified btn-group-toggle" data-toggle="buttons">
        <label class="btn btn-primary{if !isset($type) || $type !== 'guide'} active{/if}" onclick="$('#type').val('tourist');console.log('hoge')">
          <input type="radio" id="type-tourist" autocomplete="off" checked>Tourist
        </label>
        <label class="btn btn-primary{if isset($type) && $type === 'guide'} active{/if}" onclick="$('#type').val('guide')">
          <input type="radio" id="type-guide" autocomplete="off">Guide
        </label>
      </div>
    </div>
    <div class="form-group">
      <label for="name" class="control-label">Name</label>
      <div class="input-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
          <input name="name" type="text" class="form-control" placeholder="Name" value="{if isset($name)}{$name|escape}{/if}">
      </div>
    </div>
    <div class="form-group">
      <label for="email_address" class="control-label">Email Address</label>
      <div class="input-group">
        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
        <input name="email_address" type="text" class="form-control" placeholder="Email Address" value="{if isset($email_address)}{$email_address|escape}{/if}">
      </div>
    </div>
    <div class="form-group">
      <label for="password" class="control-label">Password (must be 6 to 32 characters long)</label>
      <div class="input-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
          <input name="password" type="password" class="form-control" placeholder="Password">
      </div>
    </div>
    <div class="form-group">
      <label for="location" class="control-label">Location</label>
      <div class="input-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></span>
          <input name="location" type="text" class="form-control" placeholder="Location (e.g. USA)" value="{if isset($location)}{$location|escape}{/if}">
      </div>
    </div>
    <div class="u-pt30">
        <button class="p-button-main" type="submit" name="button">Register</button>
    </div>
  </form>
</section>
{include file="footer.tpl"}
