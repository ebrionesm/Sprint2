/* Queries óptica */
SELECT gafas.* FROM gafas JOIN empleado_vende_a_cliente ON gafas.id_gafas = empleado_vende_a_cliente.id_gafas JOIN cliente ON empleado_vende_a_cliente.id_cliente = cliente.id_cliente WHERE cliente.id_cliente = 1;
SELECT empleado.nombre, gafas.*, empleado_vende_a_cliente.fecha_venta FROM empleado JOIN empleado_vende_a_cliente ON empleado_vende_a_cliente.id_empleado = empleado.id_empleado JOIN gafas ON empleado_vende_a_cliente.id_gafas = gafas.id_gafas WHERE empleado.id_empleado = 1 && (YEAR(empleado_vende_a_cliente.fecha_venta) = '2024' ||  YEAR(empleado_vende_a_cliente.fecha_venta) = '2023');
SELECT proveedor.*, gafas.* FROM proveedor JOIN gafas ON gafas.id_proveedor = proveedor.nif JOIN empleado_vende_a_cliente ON empleado_vende_a_cliente.id_gafas = gafas.id_gafas;

/*Queries pizzeria */
SELECT COUNT(bebida.id_producto), cliente.nombre FROM bebida JOIN producto ON bebida.id_producto = producto.id_producto JOIN pedido_tiene_producto ON pedido_tiene_producto.id_producto = producto.id_producto JOIN pedido ON pedido_tiene_producto.id_pedido = pedido.id_pedido JOIN cliente ON cliente.id_cliente = pedido.id_cliente WHERE cliente.localidad = 'Localidad1';
SELECT COUNT(empleado.id_empleado), empleado.nombre FROM empleado JOIN pedido ON empleado.id_empleado = pedido.id_empleado WHERE empleado.nombre = 'Empleado1';