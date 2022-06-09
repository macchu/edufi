## Welcome To EduFI
### Welcome To EduFi the education portal of the future.

### Please make sure you initiate a git repo locally with the provided code and include the `.git` folder with your commits.  Feel free to submit this to us in a private github repo.

**Setup**
This is a pretty basic Rails application.
`bundle install` and `rails db:setup` should take care of the setup process.
Run `rails s` to start the server and `rspec` to run the test suite.

**Your tasks, if you decide to complete them are to:**
<li>
  Create a student transfer page that will transfer one student from one school to another.
  If the student has an active enrollment, display a message letting the user know the
  student cannot be moved because they have an active enrollment.
  Indicate to us where you have decided to place the transfer student tool.

  <ul>
    <li>Transfer tool is accessed by clicking the 'Transfer student' link near the bottom of students#show page. Users
      may also change the school id within students#edit.
    </li>
  </ul>
</li>

<li>
  Run the test suite and fix all the tests that are currently erroring.
  You can decide whether the tests are broken or the application is broken and implement
  the fix accordingly.
  <ul>
    <li style="color:blue"> Most errors involved enrollments. I thought the tests were wrong because they did not reflect the 
      necessity of nesting enrollments within school. I fixed the specs by changing the path being tested in the request specs.
    </li>
  </ul>
</li>

<li>
  BONUS #1: Feel free to refactor/update anything in the codebase that you think
  could be improved (it could either be about the code quality or the functionality)
  <ul>
    <li style="color:blue"> Editing a student's cohort was broken, so I initially removed that field from student/:id/edit and added a link
      to add an enrollment. Realizing now that I should add a tool for edit and destroy as well.
    </li style="color:blue">
    <li style="color:blue"> I ran Bullet to identify n+1 errors and fixed them with includes.</li>
    <li style="color:blue"> Changed Enrollments.school_id from string to int. </li>
  </ul>
</li>

<li>
  BONUS #2: Integrate the Google Maps API, or any other MAP api to show a map of the
  School based on its location. Display the School map on the School show page.
  Please include your map api key if you execute this bonus.
  <ul>
    <li style="color:blue">I did this using the Google api.</li>
  </ul>
</li>

**Notes:**
<b>Please work on this repo, committing your work. When complete please zip the repo back up and email it to jwindholtz@everfi.com</b>
<b>
Preferrably try to complete this within 7 days of receipt.
We expect this to take around 2-3 hours, but there's no hard time limit on this.
</b>

<b>Good luck and thank you for your time.</b>

