/*Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.(Product(maker, model, type)))*/

№1
SELECT maker, MAX(TYPE) AS TYPE
FROM product
GROUP BY maker
HAVING COUNT (model)> 1 AND MAX(TYPE)=MIN(TYPE)

№2
with tmp as(
SELECT DISTICT maker,type 
FROM product pr
where maker in (select maker 
                from product 
                group by maker
                having count(model)>1)
)

select maker,type from tmp
where maker in(select maker from tmp group by maker having count(type) = 1)
