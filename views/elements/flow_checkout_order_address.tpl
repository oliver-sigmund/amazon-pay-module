[{capture name="amazonpay_script"}]
    $('#amznChangeAddress').click(function (e) {
        e.preventDefault();
    });
    amazon.Pay.bindChangeAction('#amznChangeAddress', {
        amazonCheckoutSessionId: '[{$oViewConf->getAmazonSessionId()}]',
        changeAction: 'changeAddress'
    });
[{/capture}]
[{assign var="oDeliveryAddress" value=$oView->getFilteredDeliveryAddress()}]
[{assign var="oBillingAddress" value=$oView->getFilteredBillingAddress()}]
[{oxscript add=$smarty.capture.amazonpay_script}]
<div id="orderAddress" class="row">
    <div class="col-xs-12 col-md-6">
        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="fnc" value="">
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        [{oxmultilang ident="BILLING_ADDRESS"}]
                        <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                            <i class="fa fa-pencil"></i>
                        </button>
                    </h3>
                </div>
                <div class="panel-body">
                    [{include file="amazonpay/filtered_billing_address.tpl" billadr=$oBillingAddress}]
                </div>
                [{assign var="missingRequiredBillingFields" value=$oView->getMissingRequiredBillingFields()}]
                [{if $missingRequiredBillingFields|@count}]
                    <div class="panel-footer">
                        [{include file="amazonpay/flow_missing_billing_address.tpl" missingfields=$missingRequiredBillingFields}]
                    </div>
                [{/if}]
            </div>
        </form>
    </div>
    <div class="col-xs-12 col-md-6">
        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="fnc" value="">
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        [{oxmultilang ident="SHIPPING_ADDRESS"}]
                        <button type="submit" id="amznChangeAddress" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                            <i class="fa fa-pencil"></i>
                        </button>
                    </h3>
                </div>
                <div class="panel-body">
                    [{if $oDeliveryAddress}]
                        [{include file="amazonpay/filtered_delivery_address.tpl" delivadr=$oDeliveryAddress}]
                    [{else}]
                        [{include file="amazonpay/filtered_billing_address.tpl" billadr=$oBillingAddress}]
                    [{/if}]
                </div>
                [{assign var="missingRequiredDeliveryFields" value=$oView->getMissingRequiredDeliveryFields()}]
                [{if $missingRequiredDeliveryFields|@count}]
                    <div class="panel-footer">
                        [{include file="amazonpay/flow_missing_delivery_address.tpl" missingfields=$missingRequiredDeliveryFields}]
                    </div>
                [{/if}]
            </div>
        </form>
    </div>
</div>