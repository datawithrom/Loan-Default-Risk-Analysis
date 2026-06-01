use loanproject
select * from dbo.borrower_profiles
select * from dbo.loan_applications
 select count(*) from dbo.loan_applications as total_loan_applications
 select count(*) as total_defaulted_loans from dbo.loan_applications where defaulted = 1 
select
    concat(
        cast(
            round(
                sum(case when defaulted = 1 then 1 else 0 end) * 100.0 / count(*),
                2
            ) as decimal(5,2)
        ),
        '%'
    ) as default_rate_percentage
from dbo.loan_applications;


with credit_bucket as (
    select
        la.defaulted,
        case
            when bp.credit_score between 520 and 599 then '520-599'
            when bp.credit_score between 600 and 649 then '600-649'
            when bp.credit_score between 650 and 699 then '650-699'
            when bp.credit_score between 700 and 749 then '700-749'
            else '750+'
        end as credit_score_bucket
    from dbo.loan_applications la
    join dbo.borrower_profiles bp
        on la.borrower_id = bp.borrower_id
)
select
    credit_score_bucket,
    count(*) as total_loans,
    sum(cast(defaulted as int)) as total_defaults,
    cast(cast(round(sum(cast(defaulted as int)) * 100.0 / count(*),2) as decimal(5,2))as varchar(10))+ '%' as default_rate
from credit_bucket
group by credit_score_bucket
order by default_rate desc;

with dti_bucket as (
    select
        la.defaulted,
        case
            when la.dti_ratio < 30 then '0-29.99%'
            when la.dti_ratio between 30 and 49.99 then '30-49.99%'
            when la.dti_ratio between 50 and 69.99 then '50-69.99%'
            when la.dti_ratio between 70 and 89.99 then '70-89.99%'
            when la.dti_ratio between 90 and 100 then '90-100%'
            else '100%+'
        end as dti_bucket
    from dbo.loan_applications la
join dbo.borrower_profiles bp
        on la.borrower_id = bp.borrower_id
)select
    dti_bucket,
    count(*) as total_loans,
    sum(cast(defaulted as int)) as total_defaults,
    cast(cast(round(sum(cast(defaulted as int)) * 100.0 / count(*),2) as decimal(5,2))as varchar(10))+ '%' as default_rate
    from dti_bucket
    group by dti_bucket
    order by default_rate desc;

    with loan_purpose_default as (
    select
        la.defaulted,
        la.loan_purpose as loan_purpose from dbo.loan_applications la join
        dbo.borrower_profiles bp on la.borrower_id = bp.borrower_id)
        select loan_purpose_default.loan_purpose, count(*) as total_loans, sum(cast(loan_purpose_default.defaulted as int)) as total_defaults,
        cast(cast(round(sum(cast(loan_purpose_default.defaulted as int))
        * 100.0 / count(*),2) as decimal(5,2))as varchar(10))+ '%' as default_rate
        from loan_purpose_default group by loan_purpose_default.loan_purpose order by default_rate desc;

        with annual_income_bucket as (
        select 
        la.defaulted,case when bp.annual_income < 30000 then '0-29,999'
        when bp.annual_income between 30000 and 59999 then '30,000-59,999'
        when bp.annual_income between 60000 and 89999 then '60,000-89,999'
        when bp.annual_income between 90000 and 119999 then '90,000-119,999'
        else '120,000+' end as annual_income_bucket
        from dbo.loan_applications la join dbo.borrower_profiles bp on la.borrower_id = bp.borrower_id)
        select annual_income_bucket, count(*) as total_loans, sum(cast(defaulted as int)) as total_defaults,
        CAST(CAST(ROUND(SUM(CAST(defaulted AS int)) * 100.0 / COUNT(*), 2) AS decimal(5,2)) AS varchar(10)) + '%' 
        AS default_rate from annual_income_bucket group by annual_income_bucket order by default_rate desc;

        with interest_rate_bucket as (
            select
                la.defaulted,
                case
                    when la.interest_rate < 5 then '0-4.99%'
                    when la.interest_rate between 5 and 9.99 then '5-9.99%'
                    when la.interest_rate between 10 and 14.99 then '10-14.99%'
                    when la.interest_rate between 15 and 19.99 then '15-19.99%'
                    else '20%+'
                end as interest_rate_bucket
            from dbo.loan_applications la
        )
        select
            interest_rate_bucket,
            count(*) as total_loans,
            sum(cast(defaulted as int)) as total_defaults,
            cast(cast(round(sum(cast(defaulted as int)) * 100.0 / count(*),2) as decimal(5,2))as varchar(10))+ '%' as default_rate
        from interest_rate_bucket
        group by interest_rate_bucket
        order by default_rate desc;