-- Q1: What badges have authors of 5 posts with the highest score?

select max(Score) as Max_score ,OwnerUserId, (
    select group_concat(Name)
    from badges
    where UserId = 5
    ) as All_badges
from stats_stackexchange.posts
group by OwnerUserId
order by Max_score desc
limit 5;

-- Q2: Show age of 5 people whose content generated the most views.

select sum(posts.ViewCount) as View_sum, users.Id, users.Age
from posts
right join users
on posts.OwnerUserId = users.Id
where users.Age is not null
group by users.Id
order by View_sum desc
limit 5;

-- Q3: Find answers with higher scores than the question.

select answers.Id, questions.Id, answers.Score, questions.Score
from posts as answers
inner join posts as questions
on answers.ParentId = questions.Id
where answers.PostTypeId = 2 and questions.Score < answers.Score;

-- Q4: What's the average age of users?

select avg(Age) as Avg_age
from users
where Age is not null;

-- Q5: What's the average number of badges per user?

select avg(x.badgesCount) from
    (select count(users.Id) as badgesCount
    from users
    left join badges b on users.Id = b.UserId
    group by users.Id) x;

-- Q6: Find top 5 comments made between 2009-02-10 and 2011-02-10 containing "t-test".

select *
from comments
where Text like '%t-test%' and CreationDate between '2009-02-10' and '2011-02-10'
order by Score desc
limit 5;