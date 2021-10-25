from sqlalchemy import Column, String, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql.ddl import DDLBase
import sqlalchemy

# create a base class
Base = declarative_base()

# define ORM class
class User(Base):
    # table name
    __tablename__ = 'user'
    # table structrue
    id = Column(String(20), primary_key=True)
    name = Column(String(20))

# initialize database connection
# databse+connector://user:password@host:port/database
engine = create_engine('mysql+mysqlconnector://root:aojue@localhost:3306/test')
# create DBSession class
DBSession = sessionmaker(bind=engine)

### create table: CREATE TABLE ...
Base.metadata.create_all(engine)

### add new record: INSERT INTO ...
# create DbSession object
session = DBSession()

# delete all records in User table
users = session.query(User).filter()
print(users.all())
for user in users.all():
    session.delete(user)

# create new User object
new_user = User(id = '5', name = 'Bob')
# add to session
session.add(new_user)
# commit to database
session.commit()
session.close()

### query: SELECT ... FROM ...
session = DBSession()
user = session.query(User).filter(User.id == 5).one()
print('type: ', type(user))
print('name: ', user.name)
session.close()