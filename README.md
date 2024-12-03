# Voting feature coding challenge for betterplace.org

This is a small skeleton rails application that serves as the foundation for our coding challenge.

## Preparation
Please follow the steps below before starting:
1. create a private repository called `betterplace_coding_challenge`
2. Run the following in its parent directory
    ```
    git clone git@github.com:betterplace/voting_challenge.git
    cd voting_challenge
    git remote set-url origin git@github.com:YOUR-GITHUB-USERNAME/betterplace_coding_challenge.git
    git push -u origin main
    ```
3. Solve the challenge
4. Provide access to betterplace devs so they can have a look. You will receive the email addresses for this during the application process. **Please do not make your solutions public!**

## Setup
There is nothing out of the ordinary in the application all the commands from a basic rails app should work. You only need to run the bundle.
```
bundle install
```

You can simulate a successful donation request with:
```
curl -X POST http://127.0.0.1:3000/donations \
-d "donation[receiver_id]=1&donation[amount_in_cents]=5000" \
-w "Status Code: %{http_code}\n"
```

## The challenge
Your task is to implement a voting feature based on the feature description and requirements below.
You can take as much time as needed but we planned with a time frame of 1-2h.
It is okay to submit the challenge without fully solving it. We're all human and have limited time, especially if it is unpaid ;).
Instead of a 100% solution we are more interested in your approach, considerations and code.
If you have any questions feel free to reach out at any time.

### Feature description
During a charity stream, streamers can initiate votes (e.g., challenges, decisions etc.) via a voting feature. Viewers participate by donating to cast their votes for the options provided. The option with the highest voting count wins.

* Only the votes of confirmed donations should be counted.
* Donating without voting should still be possible.
* Only one Question can be asked at a time.
* If a request arrives that would answer a question that is currently not asked the vote should be ignored.

## Closing remarks
Thank you for being interested in working with us and improving the world!
We are looking forward to discussing your solution together with you.

Cheers,
the betterplace devs.
