create schema if not exists watch_shop_goriachev;

use watch_shop_goriachev;

-- удаление представлений
drop view if exists view_stock_watches;

-- создание представления Часы в наличии
create view view_stock_watches
as
select 
    id,
    name,
    manufacture_id,
    watch_type_id,
    amount
from (select w.watch_id,
             sum(w.sum) as amount
      from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
            from watches
                     left join purchases p on watches.id = p.watch_id
            group by watches.id
            union
            select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
            from watches
                     left join sales p on watches.id = p.watch_id
            group by watches.id) as w
      group by w.watch_id) as res
         join watches on res.watch_id = watches.id;
