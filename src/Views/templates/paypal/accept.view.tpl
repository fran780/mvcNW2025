<div class="container-invoice">
  <h1>Orden Aceptada</h1>
  <hr />
  {{with order}}
  <section class="invoice">
      <p><strong>ID de Orden:</strong> {{id}}</p>
      <p><strong>Estado:</strong> {{status}}</p>
      <p><strong>Fecha:</strong> {{update_time}}</p>
      <p><strong>Cliente:</strong> {{payer_name}}</p>
      <p><strong>Correo:</strong> {{payer_email}}</p>
      <p><strong>Comisión PayPal:</strong> {{paypal_fee}} {{currency}}</p>
      <p><strong>Monto Neto:</strong> {{net_amount}} {{currency}}</p>
      <p><strong>Total:</strong> {{amount}} {{currency}}</p>
  </section>
  {{endwith order}}
</div>