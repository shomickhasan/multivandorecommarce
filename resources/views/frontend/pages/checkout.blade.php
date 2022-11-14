@extends('frontend.master_template.template')
@section('body')
<section class="checkout-section section_space">
    <div class="container">
        <div class="row">
            <div class="col col-xs-12">
                <div class="woocommerce bg-light p-3">
                    <form name="checkout" method="post" class="checkout woocommerce-checkout" action="{{ route('web.payment.step') }}">
                        @csrf
                        <input type="hidden" name="payment_type" value="sslcommerz">
                        <div class="col2-set" id="customer_details">
                            <div class="coll-1">
                                <div class="woocommerce-billing-fields">
                                    <h3>Billing Details</h3>
                                    <p class="form-row form-row form-row-first validate-required"
                                        id="billing_first_name_field">
                                        <label for="ship_fullName" class="">Full Name <abbr class="required"
                                                title="required">*</abbr></label>
                                        <input type="text" class="input-text " name="ship_fullName"
                                            id="billing_first_name" placeholder="" autocomplete="given-name" value=""  required/>
                                            @error('ship_fullName')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                    </p>
                                    <p class="form-row form-row form-row-last validate-required validate-email"
                                        id="billing_email_field">
                                        <label for="ship_email" class="">Email Address <abbr class="required"
                                                title="required">*</abbr></label>
                                        <input type="email" class="input-text " name="ship_email" id="billing_email"
                                            placeholder="" autocomplete="email" value="" required/>
                                    </p>
                                    <div class="clear"></div>
                                    <p class="form-row form-row form-row-first" id="billing_company_field">
                                        <label for="ship_companyName" class="">Company Name</label>
                                        <input type="text" class="input-text " name="ship_companyName"
                                            id="billing_company" placeholder="" autocomplete="organization" value="" required/>
                                    </p>

                                    <p class="form-row form-row form-row-last validate-required validate-phone"
                                        id="billing_phone_field">
                                        <label for="ship_phone" class="">Phone <abbr class="required"
                                                title="required">*</abbr></label>
                                        <input type="tel" class="input-text " name="ship_phone" id="billing_phone"
                                            placeholder="" autocomplete="tel" value="" required/>
                                    </p>
                                    <div class="clear"></div>
                                    <p class="form-row form-row form-row-first" id="billing_company_field">
                                        <label for="ship_country" class="">Country</label>
                                        <input type="text" class="input-text " name="ship_country"
                                            id="billing_company" placeholder="" autocomplete="country" value="" required/>
                                    </p>

                                    <p class="form-row form-row form-row-last validate-required validate-phone"
                                        id="billing_phone_field">
                                        <label for="ship_division" class="">Division <abbr class="required"
                                                title="required">*</abbr></label>
                                        <input type="tel" class="input-text " name="ship_division"
                                            placeholder="" autocomplete="tel" value="" required/>
                                    </p>
                                    <div class="clear"></div>
                                    <p class="form-row form-row form-row-wide address-field validate-required"
                                        id="billing_address_1_field">
                                        <label for="ship_address" class="">Address <abbr class="required"
                                                title="required">*</abbr></label>
                                        <input type="text" class="input-text " name="ship_address"
                                            id="billing_address_1" placeholder="Street address"
                                            autocomplete="address-line1" value="" required/>
                                    </p>
                                </div>
                                <p class="form-row form-row notes" id="order_comments_field">
                                    <label for="ship_comments" class="">Order Notes</label>
                                    <textarea name="ship_comments" class="input-text " id="order_comments"
                                        placeholder="Notes about your order, e.g. special notes for delivery." rows="2"
                                        cols="5"></textarea>
                                </p>
                            </div>
                        </div>
                        <h3 id="order_review_heading">Your order</h3>
                        <div id="order_review" class="woocommerce-checkout-review-order">
                            <table class="shop_table woocommerce-checkout-review-order-table">
                                <tr class="cart-subtotal">
                                    <th>Subtotal</th>
                                    <td><span class="woocommerce-Price-amount amount"><span
                                                class="woocommerce-Price-currencySymbol">$ </span>{{ Cart::subTotal() }}</span>
                                    </td>
                                </tr>
                                @if (Session::has('coupon'))
                                <tr class="cart-subtotal">
                                    <th>Discount</th>
                                    <td><span class="woocommerce-Price-amount amount"><span
                                                class="woocommerce-Price-currencySymbol">$ </span>{{ Session::get('coupon')['discount'] }}</span>
                                    </td>
                                </tr>
                                <tr class="order-total">
                                    <th>Total</th>
                                    <td><strong><span class="woocommerce-Price-amount amount"><span
                                                    class="woocommerce-Price-currencySymbol">$ </span>{{ Session::get('coupon')['balance'] }}</span></strong>
                                    </td>
                                </tr>
                                @else
                                <tr class="order-total">
                                    <th>Total</th>
                                    <td><strong><span class="woocommerce-Price-amount amount"><span
                                                    class="woocommerce-Price-currencySymbol">$ </span>{{ Cart::subTotal() }}</span></strong>
                                    </td>
                                </tr>
                                @endif
                                
                            </table>
                            <div id="payment" class="woocommerce-checkout-payment py-3 mt-5">
                                <div class="form-row place-order">
                                    <button type="submit" class="button alt" id="place_order"><i class="fas fa-credit-card"></i> Pay Now</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection