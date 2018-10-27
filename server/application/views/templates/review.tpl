{include file="header.tpl" title="Send Reviews"}

<h1>Send Reviews</h1>

<!--add the special style sheet of this page here!-->
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
    background-color: #FF2525;
    color: #ffffff
  }
  .input-group-addon{

  }
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30 text-center">
  <!--Title-->
  <h2 class="u-pt100 u-color-gray">Send Reviews</h1>
  <!--text box of reviews-->
  <div class="input-group u-pt30">
    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
    <input type="text" class="form-control" placeholder="Please, write the reviews.">
  </div>
  <!--send button-->
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Send</button>
  </div>
</section>

{include file="footer.tpl"}
