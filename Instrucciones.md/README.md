# sql-katas
La solicitud es analizar la fatiga tras el envío de diversas campañas a través de 3 diferentes canales. Deberé medir el nivel de interacción por usuario en los últimos 7 días, según el número de veces que ha sido contactado vía SMS, mail o push. Tengo que analizar el fenómeno producido por el envío de más mensajes en un lapso de tiempo corto vs. la interacción que el usuario tiene con dichos mensajes.

**1)** Entonces debo calcular primero el número de mensajes por usuario; ¿Cuántas veces se le ha enviado éste mensaje a éste usario en los últimos 7 días?
-Recuento *prior_touches*, solo se cuentan los mensajes del mismo usuario y estrictamente los anterioes a la marca de tiempo sent_at del envío actual. Contar TODOS los envíos previos a los últimos 7 días, no importando el canal o la campaña. La fatiga es por usuario NO por campaña.

**2)** Debo verificar si el usario interactuó con la campaña dentro de las 24 HRS siguientes a la hora del envío. ¿Hubo interacción? T/F, cualquier tipo de interacción cuenta no importa el canal o el evento. Ojo para considerar si coincide la interacción deberá ser el _mismo usuario_ y la _misma campaña_. El canal no tiene que coincidir. **_NO contar el envío actual debe ser: exactamente hace 7 días no 7 días + 1 minuto porque ya no cuenta como previo, misma estampa de tiempo que el envío actual tampoco cuenta._**

**Notas)** Debo agrupar por *prior_touches*. El resultado esperado debe tener éstas 4 columnas: prior_touches, sends, engagements, engagement_rate_pct. También debo ordenar el resultado final por *prior_touches* _ASC_. Los usuarios sin interacción se incluyen contibuyendo al recuento de _sends_ y su valor de engagements permanece en 0 para la tasa de interacción.

tablas:

engagement_events: *id, event_time, campaign_id, channel, event_type*

campaign_sends: *id, user_id, sent_at, campaign_id, channel*
git

Dudas: ¿De dónde y cómo saco el sent_at?, ¿cuáles son las fórmulas que necesito para ésto? 

Primeros pasos: conozco los datos de las tablas y transcribo a una hoja ambos panoramas.