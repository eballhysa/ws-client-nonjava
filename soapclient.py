from zeep import Client
wsdl = 'http://localhost:8080/ws-textbook-ex03-studentRegistrySoap/StudentRegistryService?WSDL'
client = Client(wsdl)
req = {'studentId': 1}
res = client.service.readStudent(req)
print("%d courses returned" % len(res.courses))
for course in res.courses:
    print("%s - %s (%d credits, %s)" % (course.code, course.title, course.credits, course.grade))
