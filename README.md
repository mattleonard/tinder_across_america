Tinder Across America
=====================

This app moves my current location to each of the top 100 cities in the US and likes every girl on Tinder within a 100 miles radius of the city center. It records some info about each like in a postgres database for future analysis.

Setup
----------
First clone the app to your local: `git clone git@github.com:mattleonard/tinder_across_america.git`

Change into the directory: `cd tinder_across_america/`

Follow the instructions on how to succesffuly grab your facebook token and id for the Tinder API below:

* [tinder_pyro](https://github.com/mattleonard/tinder_pyro)
* [Charles Proxy](http://www.charlesproxy.com/)

Once you have the facebook token and id, encrypt them in you ciphertext file

* Delete the existing file `/sekrets/ciphertext`
* Generate encryption key `rake sekrets:generate:key`
* Generate sekrets file `rake sekrets:generate:editor`
* Open up ciphertext file `./sekrets/editor`

Put the following into the cipertext file
<pre><code>:facebook_token: YOUR_FACEBOOK_TOKEN
:facebooke_id:   YOUR_FACEBOOK_ID
</pre></code>

Also run `rake db:seed` to fill the database with all 100 locations.
To add more locations, just enter the city and state. The coordinates with be populated automatically using the [geocode gem](https://github.com/alexreisner/geocoder)

Running the task
----------------
To like every girl in top 100 largest cities in the USA run:
`rake tinder:like_all`

Current Problems
----------------

* I believe I need to slow down the time in between cities because Tinder is sending back the error  `major position change not significant` even though locations change to other site of the country. May need to delay every change of location request by a couple hours. Will probably switch to sidekick and schedule jobs.

Disclaimer
----------
THIS SOFTWARE IS PROVIDED BY THE MATT LEONARD AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE MATT LEONARD OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
OF SUCH DAMAGE.
