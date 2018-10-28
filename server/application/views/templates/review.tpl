{include file="header.tpl" title="Send Reviews" user=$user}

<!--add the special style sheet of this page here!-->
<style media="screen">
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    background-color: #FF2525;
    color: #ffffff
  }
  .input-group-addon{

  }

  div.circle button.rateit-reset {
    display: none;
    width:50px;
    height:50px;
}
.p-user_icon{
  width: 100px;
  height: 100px;
  border-radius: 200px;
  border: solid 1px #FD5637;
}
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="caption text-center">Send Reviews</h1>
  {if isset($error_message_only)}
    <div class="alert alert-danger"><strong>Error</strong>: {$error_message_only}</div>
  {else}
    <form action="/review/submit?id={$guidance_id}" method="POST">
      <input name="guidance_id" type="hidden" value="{$guidance_id}">
      {if isset($error_message)}
        <div class="alert alert-danger"><strong>Error</strong>: {$error_message}</div>
      {/if}
      <h4 class="u-pt30 ">Are you satisfied?</h4>
      <div class="media u-pt30">
        <span class="media-left">
          <img class="p-user_icon" src="/images/user.jpg">
        </span>
        <div class="media-body u-pl30">
          <h4 class="media-heading">{$user['name']|escape}</h4>
            <script>
              $(function() {
                // RateItの設定 ...（2）
                $("#rateit1").rateit();
              });
            </script>
            <input type="range" value="{if isset($star)}{$star}{else}0{/if}" step="1" id="backing5" name="star">
            <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-min="0" data-rateit-max="5" data-rateit-resetable="false"></div>
        </div>
      </div>
      <p class="u-pt30">Write a review for {$user['name']|escape}:</p>
      <!--text box of reviews-->
      <div class="input-group col-xs-12">
        <textarea class="form-control " rows="5" id="comment" name="body">{if isset($body)}{$body}{/if}</textarea>
      </div>

      <!--send button-->
      <div class="u-pt30">
        <button class="p-button-main" type="submit">Send</button>
      </div>
    </form>
  {/if}
</section>
{include file="footer.tpl"}
