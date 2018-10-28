{include file="header.tpl" title="Setting" user=$user}
  <style>
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
      background-color: #c78836;
      border: none;
    }
    .panel-title{
      line-height: 40px;
      border: none;
      background-color: #FD5637;
      color: #ffffff
    }
  </style>

  <!--間違って更新しないようにするため，formのactionは無しにしています-->
  <section>
    <h2>Setting</h2>
    <!--おりたたみ-->
    <div class="panel-group" id="accordion">
      {if isset($error_message)}
          <div class="alert alert-danger"><strong>Error</strong>: {$error_message}</div>
      {/if}

      <!--名前変更-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#nameChange">Register new nickname</a>
          </h4>
        </div>
        <div id="nameChange" class="panel-collapse collapse">
          <div class="panel-body">
            <form action="#" method="POST">
              <div class="form-group">
                <label for="name" class="control-label">Name</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                    <input name="name" type="text" class="form-control" placeholder="New Name" value="">
                </div>
              </div>
              <div class="u-pt30">
                  <button class="p-button-main" type="submit" name="button">Change your nickname</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!--メールアドレス変更-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#mailChange">Register new mail address</a>
          </h4>
        </div>
        <div id="mailChange" class="panel-collapse collapse">
          <div class="panel-body">
            <form action="#" method="POST">
              <div class="form-group">
                <label for="email_address" class="control-label">Email Address</label>
                <div class="input-group">
                  <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
                  <input name="email_address" type="text" class="form-control" placeholder="New Email Address" value="">
                </div>
              </div>
              <div class="u-pt30">
                  <button class="p-button-main" type="submit" name="button">Change your email address</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!--パスワード変更-->
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#passChange">Change your password</a>
          </h4>
        </div>
        <div id="passChange" class="panel-collapse collapse">
          <div class="panel-body">
            <form action="#" method="POST">
              <!--old password-->
              <div class="form-group">
                <label for="password" class="control-label">Input your password</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                    <input name="password" type="password" class="form-control" placeholder="Your Password">
                </div>
              </div>
              <!--new password-->
              <div class="form-group">
                <label for="password" class="control-label">Register new password (must be 6 to 32 characters long)</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                    <input name="password" type="password" class="form-control" placeholder="New Password">
                </div>
              </div>
              <div class="u-pt30">
                  <button class="p-button-main" type="submit" name="button">Change your password</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  
{include file="footer.tpl"}