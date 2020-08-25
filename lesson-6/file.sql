-- 2) Пусть задан некоторый пользователь.
--    Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select count(messages.id) as count_of_messages,
from_user_id as id_of_friend,
p2.name as friend_name,
p2.lastname as friend_lastname
from messages
join profiles as p2 on p2.id = messages.from_user_id
where to_user_id = 1 and from_user_id in (select initiator_user_id from friend_requests where target_target_id = 1 and status = 'approved')
group by from_user_id
order by count_of_messages desc limit 1;

-- 3) Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select sum(count_of_posts_likes)
from (
	select count(lp.likepage) as count_of_posts_likes,
	timestampdiff(year, p.birthday, now()) as age
	from likes_posts as lp
	join profiles as p on p.id = lp.likepage
	where timestampdiff(year, p.birthday, now()) is not null
	group by p.id
	order by age limit 10
) as tbl_calculating_likes;

-- 4) Определить кто больше поставил лайков (всего) - мужчины или женщины?

select count(user_id) as count_of_likes, p.gender
from likes_posts as lp
join profiles as p on p.id = lp.likepage
group by gender
order by count_of_likes desc;

-- 5) Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

select concat(name, ' ', lastname) as name, id,
(select count(user_id) from posts where user_id = profiles.id) as count_of_posts
from profiles
order by count_of_posts limit 10;
