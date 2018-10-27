{include file="header.tpl" title="My Page"}

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

<!--section part / it contain the main parts-->
<section class="u-pd-lr30 text-center">

  <!--Title-->
  <h2 class="u-pt100 u-color-gray">My Page</h1>

  <!--Picture-->
  <image src="" class="" name="profielImage">

  <!--User's Name-->
  <span class="u-pt100" name="name" value=""></span>

  <!--My Profiel-->
  <span class="u-pt30" name="profiel" value="">test sentenses "fdisahg;dsihsdfk;jskvjdfokvgjsknvhfslbvfuislvjfnvskjdfnsbdfjnkdn"</span>
  
  <!--If part-->
  <span>{$point}</span>
  {if $type == "guide"}
    <span>
      <ul>
        {foreach $reviews as $review}
          <li>{$review}</li>
        {/foreach}
      </ul>
    <span>
  {else}
    <span>
      <ul>
        {foreach $histories as $history}
          <li>{$histories}</li>
        {/foreach}
      </ul>
    </span>
  {/if}

  <!--Order button-->
  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Order!!</button>
  </div>
</section>

{include file="footer.tpl"}
