puts 'Filling db'
for i in (1..10)
    Report.create(title: 'Lorem Ipsum', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim, ipsum vel lobortis vulputate, dolor justo rhoncus nulla, id sollicitudin nunc eros a magna. Nam viverra imperdiet mi, non gravida tellus consequat ac. Aenean non pellentesque ex. Vivamus eleifend vestibulum risus a imperdiet. Vivamus ultrices bibendum venenatis. Nunc posuere nulla vitae risus ullamcorper volutpat. Proin scelerisque accumsan enim, et imperdiet est blandit sit amet. Fusce a augue aliquet, cursus erat consectetur, consectetur sapien.')
end
User.create(email: 'test1@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'admin', mailing_period: 'cancel'})
User.create(email: 'test2@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'editor', mailing_period: 'cancel'})
User.create(email: 'test3@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'user', mailing_period: 'daily'})
User.create(email: 'test4@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'user', mailing_period: 'weekly'})
