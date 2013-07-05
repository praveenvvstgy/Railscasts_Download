#Railscasts Download
Lets you download, Free, Pro and Revised Episodes form the Railscasts website

##Downloading Free Episodes
`free_download.rb` lets you download all the free episodes from railscasts

	$ chmod +x free_download.rb
	$ ./free_download.rb

* * * * 
##Downloading Pro Episodes
`pro_download.rb` lets you download all the pro episodes from 
railscasts

>**Note:** To download pro episodes, you will need a subscription
>from [railscasts.com](http://railscasts.com)
>If you have a subscription, then you need to obtain the private RSS Feed
>url at <https://railscasts.com/subscriptions/current>

	$ chmod +x pro_download.rb
	$ ./pro_download.rb
* * * * 
##Downloading revised Episodes
`revised_download.rb` lets you download all the revised episodes from 
railscasts

>**Note:** To download revised episodes, you will need a subscription
>from [railscasts.com](http://railscasts.com)
>If you have a subscription, then you need to obtain the private RSS Feed
>url at <https://railscasts.com/subscriptions/current>

	$ chmod +x revised_download.rb
	$ ./revised_download.rb
* * * *
*All the above scripts will first make sure whether the video has been already downloaded, and
the video will be downloaded only if it has not yet been downloaded which prevents duplicate videos*