local Thread1 = coroutine.create(function()
    -- Your first script goes here
end)

coroutine.resume(Thread1)

-- Your second script goes after coroutine.resume