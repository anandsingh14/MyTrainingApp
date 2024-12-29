import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceAdd {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Method to add sample training data to Firestore
  Future<void> addSampleTrainings() async {
    final trainings = [
      {
        'title': 'AWS',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "trainerName": "John Doe",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        "title": "Scrum Master",
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "trainerName": "John Doe",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        "imageUrl": "https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg"
      },
      {
        'title': 'Service Now',
        'trainerName': 'Jane Smith',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },

      {
        'title': 'Google cloud',
        'trainerName': 'Liam Carter',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'Android develpment',
        'trainerName': 'Robert Brown',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'Ios develpment',
        'trainerName': 'Eve Davis',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'Web develpment',
        'trainerName': 'Samuel Green',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'HTML CSS',
        'trainerName': 'Alice Johnson',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'JAVA',
        'trainerName': 'David Lee',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },
      {
        'title': 'Springboot',
        'trainerName': 'Maria White',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      },

      {
        'title': 'Design Pattern',
        'trainerName': 'Sophia Martinez',
        "description": "AWS stands for Amazon Web Services, it needs no formal introduction, given its immense popularity. The leading cloud provider in the marketplace is Amazon Web Services. It provides over 170 AWS services to the developers so they can access them from anywhere at the time of need.AWS has customers in over 190 countries worldwide, including 5000 ed-tech institutions and 2000 government organizations. Many companies like ESPN, Adobe, Twitter, Netflix, Facebook, BBC, etc., use AWS services.\n\nFor example, Adobe creates and updates software without depending upon the IT teams. It uses its services by offering multi-terabyte operating environments for its clients. By deploying its services with Amazon services, Adobe integrated and operated its software in a simple manner.\n\nNow, before getting started with what is AWS, let us first give you a brief description of what cloud computing is.",
        "location": "Convention Hall, Des Moines",
        "date": "Oct 11-13, 2025",
        "time": "08:00AM - 12:00PM",
        'imageUrl': 'https://img.freepik.com/free-photo/profile-handsome-businessman-glasses-smiling-short-haired-boss-white-shirt-grey-tie-keeping-documents-his-hands_549566-469.jpg',
      }
    ];

    try {
      for (var training in trainings) {
        await _db.collection('trainings').add(training);
      }
      print('Sample training data added successfully.');
    } catch (e) {
      print('Error adding sample training data: $e');
    }
  }
}
