# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.delete_all
Review.delete_all

[{:title => "The University of Chicago", :photo_url => "http://upload.wikimedia.org/wikipedia/commons/1/1a/Harper_Midway_Chicago.jpg", :admission_price => 0, :description => "The University of Chicago (U of C, UChicago, or simply Chicago) is a private research university in Chicago, Illinois. Founded by the American Baptist Education Society with a donation from oil magnate and philanthropist John D. Rockefeller, the University of Chicago was incorporated in 1890; William Rainey Harper became the university's first president in 1891, and the first classes were held in 1892. Both Harper and future president Robert Maynard Hutchins advocated for Chicago's curriculum to be based upon theoretical and perennial issues rather than applied sciences and commercial utility. \n(*The $0 admission price is for walking around the scenic campus, not attending the University)"},
{:title => "Symphony Center", :photo_url => "http://soundfusemag.com/wp-content/uploads/2012/12/Chi-Symphony_Center_aud-590x421.jpg", :admission_price => 5000, :description => "Symphony Center is a music complex located at 220 South Michigan Avenue in the Loop area of Chicago, Illinois. Home to the Chicago Symphony Orchestra, Chicago Symphony Chorus, Civic Orchestra of Chicago, Chicago Sinfonietta, and the Institute for Learning, Access, and Training, Symphony Center includes the 2,522-seat Orchestra Hall, which dates from 1904; Buntrock Hall, a rehearsal and performance space; Grainger Ballroom, an event space overlooking Michigan Avenue and the Art Institute of Chicago; a public multi-story rotunda; tesori restaurant; and administrative offices. In June 1993, plans to significantly renovate and expand Orchestra Hall were approved and the $110 million project resulting in Symphony Center being completed from 1995 to 1997. Orchestra Hall at Symphony Center was designated a National Historic Landmark on April 19, 1994. It has been listed on the National Register of Historic Places since 1978."},
{:title => "Will's Northwoods Inn", :photo_url => "http://a0fe076c348d6c06a7c7-bb25d1c1db8fb06d5badee0971279654.r40.cf2.rackcdn.com/chicago/story/image/1081/featured_Wills1112.png", :admission_price => 0, :description => "Will’s Northwoods Inn was founded in 1991 by descendants of William Wheeler. Will Wheeler was born in 1847 at Odanah (near Ashland, Wisconsin) in what was then known as the Northwest Territory. His parents, Leonard and Harriet Wheeler, were Congregational missionaries to the Ojibwa Indians who settled on Madeline Island, one of the Apostle Islands in Lake Superior. A few years later, the Wheelers founded the town of Odanah, where their son Will was born. \nCome on in to support the Green Bay Packers, Wisconsin Badgers, Marquette University Golden Eagles, Chicago Cubs, Milwaukee Brewers, Chicago White Sox, Chicago Bulls, and the Chicago Blackhawks!"},
{:title => "Wrigley Field", :photo_url => "http://chicagotonight.wttw.com/sites/default/files/article/image-non-gallery/Wrigley_Field_-_by_Kaczmarczyk.jpg", :admission_price => 3500, :description => "Wrigley Field is a baseball stadium located in Chicago, Illinois, United States, home of the Chicago Cubs. It was built in 1914 as Weeghman Park for the Chicago Federal League baseball team, the Chicago Whales. The Cubs played their first game at Weeghman Park on April 20, 1916, defeating the Cincinnati Reds 7–6 in eleven innings. In November 1918, Weeghman resigned as team president. Chewing gum magnate William Wrigley, Jr. acquired complete control of the Cubs by 1921. It was called Cubs Park from 1920 through 1926, before officially becoming Wrigley Field for the 1927 season."},
{:title => "Art Institute", :photo_url => "http://www.conciergepreferred.com/media/k2/items/cache/c3997142576e6f4d163ead570965368d_XL.jpg", :admission_price => 2500, :description => "The Art Institute of Chicago (AIC) is an encyclopedic art museum located in Chicago's Grant Park. It features a collection of Impressionist and Post-Impressionist art in its permanent collection. Its holdings also include American art, Old Masters, European and American decorative arts, Asian art, modern and contemporary art, and architecture and industrial and graphic design. In addition, it houses the Ryerson & Burnham Libraries. Tracing its history to a free art school and gallery founded in 1866, the museum is located at 111 South Michigan Avenue in the Chicago Landmark Historic Michigan Boulevard District. It is associated with the School of the Art Institute of Chicago and is overseen by Director and President Douglas Druick. At one million square feet, it is the second-largest art museum in the United States, after the Metropolitan Museum of Art."},
{:title => "Billy Goat Tavern", :photo_url => "http://www.signs3.com/site/wp-content/uploads/2013/03/work-nathan-014.jpg", :admission_price => 0, :description => "The Billy Goat Tavern is a chain of taverns located in Chicago, Illinois, founded in 1934[1] by Billy Sianis, a Greek immigrant. It achieved fame primarily through newspaper columns by Mike Royko, a supposed curse on the Chicago Cubs, and the Olympia Cafe sketch on Saturday Night Live. It now has several locations in the Chicago area, including Navy Pier, the Merchandise Mart, O'Hare Airport, Randhurst Village in Mt. Prospect, and the West Loop on Madison Street, just blocks from the United Center, and expanded to Washington, D.C. in 2005. The D.C. location is the first outside of the Chicago area and is intended to appeal primarily to politicians, lobbyists, and other D.C. workers who are originally from Chicago, as well as students from the Georgetown University Law Center, located across the street."}
].each do |place_hash|
	p = Place.new
	p.title = place_hash[:title]
	p.photo_url = place_hash[:photo_url]
	p.admission_price = place_hash[:admission_price]
	p.description = place_hash[:description]
	p.save
end

[{:place_id => (Place.find_by("title = 'The University of Chicago'")).id, :stars => 5, :description => "What a great school! I can learn so much about web development here!"},
{:place_id => (Place.find_by("title = 'Symphony Center'")).id, :stars => 4, :description => "Great place to catch a symphony"},
{:place_id => (Place.find_by("title = \"Will's Northwoods Inn\"")).id, :stars => 5, :description => "Home away from home for a Wisconsonite :)"},
{:place_id => (Place.find_by("title = 'Wrigley Field'")).id, :stars => 3, :description => "Even though the Cubs are division rivals with the Brewers, there's nothing quite like historic Wrigley Field!"},
{:place_id => (Place.find_by("title = 'Art Institute'")).id, :stars => 4, :description => "Take an afternoon to see all the classics!"},
{:place_id => (Place.find_by("title = 'Billy Goat Tavern'")).id, :stars => 4, :description => "Cheezborger! Cheezborger! Cheezborger!"}
].each do |review_hash|
	r = Review.new
	r.place_id = review_hash[:place_id]
	r.stars = review_hash[:stars]
	r.description = review_hash[:description]
	r.save
end
